function sendMessage() {
    let input = document.getElementById("messageInput");
    let message = input.value.trim();
    if (message == "") return;

    let messages = document.getElementById("messages");

    // Display user message
    let userMsg = document.createElement("div");
    userMsg.className = "user";
    userMsg.innerText = "You: " + message;
    messages.appendChild(userMsg);
    input.value = "";

    // Simulated Bot Reply
    setTimeout(() => {
        let botMsg = document.createElement("div");
        botMsg.className = "bot";

        let lower = message.toLowerCase();
        if (lower.includes("hello") || lower.includes("hi")) {
            botMsg.innerText = "Bot: Hello! How can I help you today?";
        } else if (lower.includes("how")) {
            botMsg.innerText = "Bot: I am doing great! Thanks for asking.";
        } else if (lower.includes("bye")) {
            botMsg.innerText = "Bot: Goodbye! Have a nice day.";
        } else {
            botMsg.innerText = "Bot: Message received: " + message;
        }

        messages.appendChild(botMsg);
        messages.scrollTop = messages.scrollHeight;
    }, 400);
}
