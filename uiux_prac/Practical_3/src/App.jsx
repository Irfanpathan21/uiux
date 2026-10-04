import { useState } from "react";
function App() {
    const [display, setDisplay] = useState("");
    function press(value) {
        setDisplay(display + value);
    }
    function calculate() {
        try {
            setDisplay(eval(display).toString());
        } catch {
            setDisplay("Error");
        }
    }
    function clear() {
        setDisplay("");
    }
    return (
        <div style={{
            width: "250px",
            margin: "50px auto",
            textAlign: "center",
            fontFamily: "Arial"
        }}>
            <h2>Calculator</h2>
            <input
                type="text"
                value={display}
                readOnly
                style={{
                    width: "230px",
                    padding: "10px",
                    fontSize: "20px",
                    marginBottom: "10px"
                }}
            />
            <br />
            <button onClick={clear}>C</button>
            <button onClick={() => press("/")}>/</button>
            <button onClick={() => press("*")}>*</button>
            <button onClick={() => press("-")}>-</button>
            <br /><br />
            <button onClick={() => press("7")}>7</button>
            <button onClick={() => press("8")}>8</button>
            <button onClick={() => press("9")}>9</button>
            <button onClick={() => press("+")}>+</button>
            <br /><br />
            <button onClick={() => press("4")}>4</button>
            <button onClick={() => press("5")}>5</button>
            <button onClick={() => press("6")}>6</button>
            <br /><br />
            <button onClick={() => press("1")}>1</button>
            <button onClick={() => press("2")}>2</button>
            <button onClick={() => press("3")}>3</button>
            <br /><br />
            <button onClick={() => press("0")}>0</button>
            <button onClick={() => press(".")}>.</button>
            <button onClick={calculate}>=</button>
        </div>
    );
}
export default App;
