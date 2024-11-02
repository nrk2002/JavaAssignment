<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tic Tac Toe</title>
    <style>
        /* Body styling with animated gradient */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(45deg, #6A5ACD, #8A2BE2, #DA70D6, #9370DB);
            background-size: 300% 300%;
            animation: gradientAnimation 10s ease infinite;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            text-align: center;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin-bottom: 20px;
        }

        #indicator {
            font-size: 1.5em;
            color: green; /* Default color for player X */
            margin-bottom: 15px;
        }

        .board {
            display: grid;
            grid-template-columns: repeat(3, 100px);
            grid-template-rows: repeat(3, 100px);
            gap: 5px;
        }

        /* Style for cell as an input submit */
        .cell {
            width: 100px;
            height: 100px;
            background-color: transparent; /* Removes background color */
            border: 2px solid #ccc; /* Keeps a faint square border */
            font-size: 4em; /* Makes the X larger */
            color: red; /* Color for X */
            text-align: center;
            font-weight: bold;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
            box-sizing: border-box; /* Ensures border is within the cell size */
        }

        /* Blue circle for O */
        .cell[value="O"] {
            color: blue;
            font-size: 0; /* Hide text */
            background-color: blue; /* Use background color to represent O */
            border-radius: 50%; /* Make it a circle */
            position: relative;
        }

        /* Adjustments for center alignment for the O circle */
        .cell[value="O"]::before {
            content: '';
            display: inline-block;
            width: 60px;
            height: 60px;
            background-color: blue;
            border-radius: 50%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .reset-button {
            margin-top: 20px; /* Space above the button */
            padding: 10px 20px; /* Padding inside the button */
            font-size: 1.2em; /* Font size of the text */
            background-color: #8A2BE2; /* violet background */
            color: white; /* White text color */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor on hover */
            transition: background-color 0.3s; /* Smooth background color change */
        }

        .reset-button:hover {
            background-color: #DA70D6; /* Darker red on hover */
        }

        * {
            box-sizing: border-box;
        }
    </style>
</head>
<body>
    <form class="container" method="post" action="TicTacToeServlet">
        <h1>Tic Tac Toe</h1>
        <h2 id="indicator"><%= request.getAttribute("indicator") != null ? request.getAttribute("indicator") : "Now Red Turn" %></h2>
        <div class="board">
            <!-- Replacing div with input for each cell -->
            <input type="submit" class="cell" name="1:1"  value="<%= request.getAttribute("1:1") != null ? request.getAttribute("1:1") : "" %>" />
            <input type="submit" class="cell" name="1:2"  value="<%= request.getAttribute("1:2") != null ? request.getAttribute("1:2") : "" %>" />
            <input type="submit" class="cell" name="1:3"   value="<%= request.getAttribute("1:3") != null ? request.getAttribute("1:3") : "" %>" />
            <input type="submit" class="cell" name="2:1"   value="<%= request.getAttribute("2:1") != null ? request.getAttribute("2:1") : "" %>" />
            <input type="submit" class="cell" name="2:2"   value="<%= request.getAttribute("2:2") != null ? request.getAttribute("2:2") : "" %>" />
            <input type="submit" class="cell" name="2:3"   value="<%= request.getAttribute("2:3") != null ? request.getAttribute("2:3") : "" %>" />
            <input type="submit" class="cell" name="3:1"   value="<%= request.getAttribute("3:1") != null ? request.getAttribute("3:1") : "" %>" />
            <input type="submit" class="cell" name="3:2"   value="<%= request.getAttribute("3:2") != null ? request.getAttribute("3:2") : "" %>" />
            <input type="submit" class="cell" name="3:3"   value="<%= request.getAttribute("3:3") != null ? request.getAttribute("3:3") : "" %>" />
        </div>
        <button id="resetButton" name="reset" class="reset-button">Reset Game</button>
    </form>
</body>
</html>
