# CardTrail - Credit Card Transaction Visualizer

CardTrail is a Flutter application that visualizes a user's credit card transactions over the past year. The app provides an interactive experience with features like dynamic card displays, transaction grids, and a detailed list of recent transactions.

## Features

- Splash Screen:
  - Includes a scaling and rotating animation that lasts for 2 seconds before transitioning to the main screen.

- Bottom Navigation Bar:
  - Toggle between the Home and Transaction screens using the bottom navigation bar.
  - Navigation is managed by GetX for smooth transitions.

- Home Screen:
  - Displays dynamic credit card information (card number, amount, and expiry date).
  - Users can change the background image of the card by interacting with color buttons.

- Transaction Screen:
  - Visualize 365 days of credit card transactions in a grid format, color-coded based on spending.
  - Horizontal and vertical scroll options allow users to easily navigate through months and days.
  - A detailed list of the 15 most recent transactions is provided for quick reference.
 
## Getting Started

To run the Fortune Cookie App on your local machine, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/jakansha2001/card_trail.git

2. **Navigate to the project directory:**

   ```bash
   cd card_trail

3. **Install dependencies:**

   Ensure all dependencies are installed by running:

   ```bash
   flutter pub get

4. **Run the app:**

   Use the following command to launch the app on an emulator or connected device:

   ```bash
   flutter run

## Running the App

- Launch the app on your preferred device or emulator.
- Upon launching, you will be presented with a splash screen that animates for 2 seconds before navigating to the main content.
- You can explore the app's two main sections:
    - Home Screen: View a dynamic credit card display and interact with color buttons to change the background image of the card.
    - Transaction Screen: Visualize transactions over the past year in a grid format and view recent transactions in a scrollable list.
 
## Documentation
For more detailed information on the approach, design decisions, and development considerations for the CardTrail app, please refer to the [documentation](https://docs.google.com/document/d/1pq32rnQ0VL7ly5oTwVvc80Lbi69wzEnqWgmF9kYjxRk/edit?usp=sharing)
