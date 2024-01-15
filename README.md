# PayStation (Frontend)

Welcome to the PayStation Frontend GitHub Repository, an AI mobile application that enables KMUTT Bookstore customers to take pictures of 20 different types of stationery items. The system will automatically generate the payment bills, allowing customers to pay for those items conveniently!

![Classes](https://github.com/jedipw/paystation_backend/assets/82791342/52a3a305-1ee0-42b8-8a35-e332d5b87153)

## Features

### Image Object Detection
- Detect 1 to 17 stationery items in an image simultaneously.
- Classify those items into one of the 20 classes.
- Operate effectively under various noisy conditions, including blur, long distance, short distance, bright, dark, and overlap.

### Real-time Video Object Detection
- Detect stationery items in real time, displaying the class name, confidence score, and bounding box.

### Summary of detected items
- Summarize the list of detected products and calculate the total price for users to complete a self-checkout.

### Upload Slip
- Allow users to upload a slip to confirm the payment.

## First Time Setup

1) Create a new file named ".env" in the root folder and insert the following line into the file:
   ```env
   API_URL=<Your IP Address>:3000
   ```

2) Run `flutter pub get` in the terminal.
3) Choose the desired device for execution.
4) Select "Run without debugging."

Note: Ensure that the backend is running first; refer to the installation manual in the README.md of paystation_backend.
