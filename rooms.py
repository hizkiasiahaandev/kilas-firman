import eel
from db import get_db

@eel.expose
def create_room(roomCode, roomName, hostName, mode, totalQuestions):
    conn = get_db()
    cursor = conn.cursor()
    try:
        mapped_mode = "random" if mode.lower() == "acak" else "ordered"
        cursor.execute(
            "INSERT INTO rooms (roomCode, roomName, hostName, mode, totalQuestions) VALUES (%s, %s, %s, %s, %s)",
            (roomCode, roomName, hostName, mapped_mode, totalQuestions)
        )
        conn.commit()
        return {"success": True, "message": "Room berhasil dibuat"}
    except Exception as err:
        return {"success": False, "message": str(err)}
    finally:
        cursor.close()
        conn.close()


@eel.expose
def get_room_data(roomCode):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    try:
        cursor.execute("SELECT * FROM rooms WHERE roomCode = %s", (roomCode,))
        room = cursor.fetchone()
        return room if room else None
    except:
        return None
    finally:
        cursor.close()
        conn.close()


@eel.expose
def add_participant(roomCode, participantName):
    conn = get_db()
    cursor = conn.cursor()
    try:
        cursor.execute("INSERT INTO participants (roomCode, participantName) VALUES (%s, %s)", (roomCode, participantName))
        conn.commit()
        return {"success": True}
    except Exception as err:
        if "Duplicate entry" in str(err):
            return {"success": False, "message": "Nama sudah digunakan di room ini"}
        return {"success": False, "message": str(err)}
    finally:
        cursor.close()
        conn.close()


@eel.expose
def get_participants(roomCode):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    try:
        cursor.execute("SELECT * FROM participants WHERE roomCode = %s", (roomCode,))
        return cursor.fetchall()
    except:
        return []
    finally:
        cursor.close()
        conn.close()


@eel.expose
def get_room_status(roomCode):
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute("SELECT status FROM rooms WHERE roomCode = %s", (roomCode,))
    row = cursor.fetchone()
    cursor.close()
    conn.close()
    return row[0] if row else None


@eel.expose
def update_room_status(roomCode, status):
    conn = get_db()
    cursor = conn.cursor()
    try:
        cursor.execute("UPDATE rooms SET status = %s WHERE roomCode = %s", (status, roomCode))
        conn.commit()
        return {"success": True}
    except Exception as err:
        return {"success": False, "message": str(err)}
    finally:
        cursor.close()
        conn.close()


@eel.expose
def start_quiz(roomCode):
    conn = get_db()
    cursor = conn.cursor()
    try:
        cursor.execute("UPDATE rooms SET status = 'started' WHERE roomCode = %s", (roomCode,))
        conn.commit()
        return {"success": True}
    except Exception as err:
        return {"success": False, "message": str(err)}
    finally:
        cursor.close()
        conn.close()


@eel.expose
def save_result(roomCode, participantName, score, correct, wrong):
    conn = get_db()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "INSERT INTO results (roomCode, participantName, score, correct, wrong) VALUES (%s, %s, %s, %s, %s)",
            (roomCode, participantName, score, correct, wrong)
        )
        conn.commit()
        return {"success": True}
    except Exception as err:
        return {"success": False, "message": str(err)}
    finally:
        cursor.close()
        conn.close()


@eel.expose
def finish_quiz(roomCode):
    conn = get_db()
    cursor = conn.cursor()
    try:
        cursor.execute("UPDATE rooms SET status = 'finished' WHERE roomCode = %s", (roomCode,))
        conn.commit()
        return {"success": True}
    except Exception as err:
        return {"success": False, "message": str(err)}
    finally:
        cursor.close()
        conn.close()

@eel.expose
def get_leaderboard(roomCode):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    try:
        cursor.execute(
            """
            SELECT participantName AS name, score, correct, wrong
            FROM results
            WHERE roomCode = %s
            ORDER BY score DESC
            LIMIT 25
            """,
            (roomCode,)
        )
        return cursor.fetchall()
    except Exception as err:
        print("Leaderboard error:", err)
        return []
    finally:
        cursor.close()
        conn.close()




@eel.expose
def submit_answer(roomCode, participantName, qId, isCorrect, qScore):
    conn = get_db()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "INSERT INTO answers (roomCode, participantName, qId, isCorrect, qScore) VALUES (%s, %s, %s, %s, %s)",
            (roomCode, participantName, qId, isCorrect, qScore)
        )
        conn.commit()
        return {"success": True}
    except Exception as err:
        return {"success": False, "message": str(err)}
    finally:
        cursor.close()
        conn.close()


@eel.expose
def calculate_result(roomCode, participantName):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    try:
        cursor.execute("""
            SELECT qScore, isCorrect
            FROM answers
            WHERE roomCode = %s AND participantName = %s
        """, (roomCode, participantName))
        data = cursor.fetchall()

        total_questions = len(data)
        correct = sum(1 for d in data if d["isCorrect"] == 1)
        wrong   = total_questions - correct
        score   = sum(d["qScore"] for d in data if d["isCorrect"] == 1)

        return {
            "total": total_questions,
            "correct": correct,
            "wrong": wrong,
            "score": score,
            "accuracy": round((correct / total_questions) * 100) if total_questions > 0 else 0
        }
    except Exception as err:
        return {"success": False, "message": str(err)}
    finally:
        cursor.close()
        conn.close()

@eel.expose
def finalize_result(roomCode, participantName):
    result = calculate_result(roomCode, participantName)
    conn = get_db()
    cursor = conn.cursor()

    try:
        cursor.execute(
            "SELECT id FROM results WHERE roomCode = %s AND participantName = %s",
            (roomCode, participantName)
        )
        existing = cursor.fetchone()

        if not existing:
            cursor.execute(
                "INSERT INTO results (roomCode, participantName, score, correct, wrong) VALUES (%s, %s, %s, %s, %s)",
                (roomCode, participantName, result["score"], result["correct"], result["wrong"])
            )
            conn.commit()

        return result
    except Exception as err:
        return {"success": False, "message": str(err)}
    finally:
        cursor.close()
        conn.close()



@eel.expose
def has_answer(roomCode, participantName, qId):
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute(
        "SELECT id FROM answers WHERE roomCode = %s AND participantName = %s AND qId = %s LIMIT 1",
        (roomCode, participantName, qId)
    )
    row = cursor.fetchone()
    cursor.close()
    conn.close()
    return row is not None
