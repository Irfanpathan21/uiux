import { useState } from "react";
function App() {
    const [count, setCount] = useState(0);
    const buttonStyle = {
        padding: "10px 18px",
        margin: "5px",
        border: "none",
        borderRadius: "5px",
        color: "white",
        cursor: "pointer",
        fontSize: "16px"
    };
    return (
        <div style={{
            textAlign: "center",
            marginTop: "50px",
            fontFamily: "Arial"
        }}>
            <h2>Counter using ReactJS</h2>
            <h1>{count}</h1>
            <button
                onClick={() => setCount(count + 1)}
                style={{ ...buttonStyle, backgroundColor: "green" }}
            >
                Increment
            </button>
            <button
                onClick={() => setCount(count - 1)}
                style={{ ...buttonStyle, backgroundColor: "red" }}
            >
                Decrement
            </button>
            <button
                onClick={() => setCount(0)}
                style={{ ...buttonStyle, backgroundColor: "gray" }}
            >
                Reset
            </button>
        </div>
    );
}
export default App;
