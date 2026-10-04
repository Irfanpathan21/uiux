import { useState } from "react";
function App() {
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const [message, setMessage] = useState("");
    function login(e) {
        e.preventDefault();
        if (username === "admin" && password === "1234") {
            setMessage("Login Successful!");
        } else {
            setMessage("Invalid Username or Password");
        }
    }
    return (
        <div style={{
            width: "300px",
            margin: "50px auto",
            padding: "20px",
            border: "1px solid black",
            borderRadius: "10px",
            fontFamily: "Arial"
        }}>
            <h2>Login Form</h2>
            <form onSubmit={login}>
                <input
                    type="text"
                    placeholder="Username"
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                    style={{
                        width: "100%",
                        padding: "8px",
                        marginBottom: "10px",
                        boxSizing: "border-box"
                    }}
                />
                <input
                    type="password"
                    placeholder="Password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    style={{
                        width: "100%",
                        padding: "8px",
                        marginBottom: "10px",
                        boxSizing: "border-box"
                    }}
                />
                <button
                    type="submit"
                    style={{
                        width: "100%",
                        padding: "10px",
                        backgroundColor: "blue",
                        color: "white",
                        border: "none",
                        borderRadius: "5px"
                    }}
                >
                    Login
                </button>
            </form>
            <p>{message}</p>
        </div>
    );
}
export default App;
