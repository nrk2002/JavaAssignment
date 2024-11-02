import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/TicTacToeServlet")
public class TicTacToeServlet extends HttpServlet {
    private HashMap<String, String> board;
    private String currentPlayer;
    private String indicator;
    private boolean reset;

    public TicTacToeServlet() {
        board = new HashMap<>();
        currentPlayer = "O";
        indicator = "Now O Turn";
        reset = false;
        initializeBoard();
    }

    private void initializeBoard() {
        board.clear();
        for (int i = 1; i <= 3; i++) {
            for (int j = 1; j <= 3; j++) {
                board.put(i + ":" + j, "");
            }
        }
    }

    private void switchPlayer() {
        currentPlayer = currentPlayer.equals("X") ? "O" : "X";
        indicator = "Now " + currentPlayer + " Turn";
    }

    private boolean checkWinner(String player) {
        for (int i = 1; i <= 3; i++) {
            if (board.get(i + ":1").equals(player) && board.get(i + ":2").equals(player) && board.get(i + ":3").equals(player)) return true;
            if (board.get("1:" + i).equals(player) && board.get("2:" + i).equals(player) && board.get("3:" + i).equals(player)) return true;
        }
        if (board.get("1:1").equals(player) && board.get("2:2").equals(player) && board.get("3:3").equals(player)) return true;
        if (board.get("1:3").equals(player) && board.get("2:2").equals(player) && board.get("3:1").equals(player)) return true;
        return false;
    }

    private boolean isBoardFull() {
        return board.values().stream().noneMatch(val -> val.isEmpty());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        initializeBoard();
        currentPlayer = "X";
        indicator = "Now X Turn";
        reset = false;
        request.setAttribute("indicator", indicator);
        board.forEach(request::setAttribute);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("reset") != null) {
            initializeBoard();
            currentPlayer = "O";
            indicator = "Now O Turn";
            reset = false;
        } else if (!reset) {
            board.forEach((key, value) -> {
                if (request.getParameter(key) != null && value.isEmpty()) {
                    board.put(key, currentPlayer);
                    if (checkWinner(currentPlayer)) {
                        indicator = currentPlayer + " has Won!";
                        reset = true;
                    } else if (isBoardFull()) {
                        indicator = "It's a Draw!";
                        reset = true;
                    } else {
                        switchPlayer();
                    }
                }
            });
        }
        request.setAttribute("indicator", indicator);
        board.forEach(request::setAttribute);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
