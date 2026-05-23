import java.io.*;
import java.util.Random;

public class CustomerDataGenerator {

    static String[] names = {
        "Rahul Sharma", "Priya Iyer", "Anjali Gupta", "Vikram Naidu", "Meena Singh",
        "Suresh Kumar", "Kiran Patel", "Arjun Kumar", "Sneha Sharma", "Ravi Iyer",
        "Anjali Singh", "Priya Naidu", "Rahul Kumar", "Anjali Naidu", "Priya Gupta"
    };

    static String[] cities = {"Mumbai", "Delhi", "Bangalore", "Hyderabad", "Chennai", "Kolkata", "Pune", "Jaipur", "Coimbatore"};
    static String[] states = {"MH", "DL", "KA", "TS", "TN", "WB", "MH", "RJ", "TN", "GJ", "WB", "TS"};
    static String[] transactionTypes = {"Credit", "Debit", "Transfer", "Withdrawal"};
    static String[] devices = {"Mobile", "Laptop", "Tablet", "ATM"};
    static String[] genders = {"Male", "Female"};

    public static void main(String[] args) throws IOException {
        int totalRecords = 1000000;
        String outputFile = "customers_1M.csv";

        BufferedWriter writer = new BufferedWriter(new FileWriter(outputFile));
        writer.write("CustomerID,Name,Age,Gender,City,State,AccountBalance,TransactionAmount,TransactionType,TransactionTime,FraudLabel,DeviceType");
        writer.newLine();

        Random rand = new Random();

        for (int i = 1; i <= totalRecords; i++) {
            String name = names[rand.nextInt(names.length)];
            int age = 18 + rand.nextInt(62); // 18 to 79
            String gender = genders[rand.nextInt(genders.length)];
            int cityIndex = rand.nextInt(cities.length);
            String city = cities[cityIndex];
            String state = states[rand.nextInt(states.length)];
            double accountBalance = 10000 + rand.nextDouble() * 90000;
            double transactionAmount = 500 + rand.nextDouble() * 49500;
            String transactionType = transactionTypes[rand.nextInt(transactionTypes.length)];
            String device = devices[rand.nextInt(devices.length)];

            // Generate transaction time
            int year = 2026;
            int month = rand.nextInt(4) + 1; // 1-4
            int day = rand.nextInt(28) + 1;
            int hour = rand.nextInt(24);
            int minute = rand.nextInt(60);
            String transactionTime = String.format("%d-%02d-%d %d:%d", year, month, day, hour, minute);

            // Fraud logic: high amount + certain types = higher chance of fraud
            int fraudLabel = 0;
            if (transactionAmount > 30000 && (transactionType.equals("Transfer") || transactionType.equals("Credit"))) {
                fraudLabel = rand.nextDouble() < 0.25 ? 1 : 0;
            } else {
                fraudLabel = rand.nextDouble() < 0.05 ? 1 : 0;
            }

            writer.write(i + "," + name + "," + age + "," + gender + "," + city + "," + state + ","
                    + String.format("%.2f", accountBalance) + "," + String.format("%.2f", transactionAmount) + ","
                    + transactionType + "," + transactionTime + "," + fraudLabel + "," + device);
            writer.newLine();

            if (i % 100000 == 0) {
                System.out.println("Generated " + i + " records...");
            }
        }

        writer.close();
        System.out.println("Done! File saved as: " + outputFile);
    }
}
