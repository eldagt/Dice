void setup() {
    size(400, 400);
    noLoop();
}

void draw() {
    background(255); // White background
    int diceSize = 50; // Size of each die
    int cols = 3; // Number of columns
    int rows = 3; // Number of rows
    int total = 0; // Total of all dice

    // Create and show the dice
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            int x = j * diceSize + 10; // X position
            int y = i * diceSize + 10; // Y position
            Die die = new Die(x, y);
            die.roll(); // Roll the die
            die.show(); // Show the die
            total += die.value; // Add to total
        }
    }

    // Display the total value of all dice
    textSize(20);
    fill(0);
    text("Total: " + total, 10, height - 20);
}

void mousePressed() {
    redraw(); // Redraw on mouse press
}

class Die {
    int x, y; // Position of the die
    int value; // Current value of the die

    Die(int x, int y) {
        this.x = x;
        this.y = y;
    }

    void roll() {
        value = (int)(Math.random() * 6) + 1; // Random value between 1 and 6
    }

    void show() {
        fill(255); // White die face
        rect(x, y, 50, 50, 10); // Draw the die

        // Draw dots based on the value
        fill(0); // Black dots
        if (value >= 1) ellipse(x + 25, y + 25, 10, 10); // Center dot
        if (value >= 2) ellipse(x + 15, y + 15, 10, 10); // Top left
        if (value >= 3) ellipse(x + 35, y + 15, 10, 10); // Top right
        if (value >= 4) ellipse(x + 15, y + 35, 10, 10); // Bottom left
        if (value >= 5) ellipse(x + 35, y + 35, 10, 10); // Bottom right
        if (value == 6) {
            ellipse(x + 15, y + 25, 10, 10); // Middle left
            ellipse(x + 35, y + 25, 10, 10); // Middle right
        }
    }
}
