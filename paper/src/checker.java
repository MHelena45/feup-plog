import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class checker {
    public static final String[] files = { "stats_9.csv", "stats_11.csv", "stats_13.csv", "stats_15.csv"};
    public static final String filesDirectory = "results/";
    public static final String destDir = "checked/";

     public static void main(String[] args) throws IOException {
        BufferedReader reader;
        Path filePath;
        Path destPath;

        for (String filename : files) {
            filePath = Paths.get(filesDirectory + filename);
            destPath = Paths.get(destDir + filename);

            Files.createFile(destPath);

            reader = Files.newBufferedReader(filePath);

            String fileLine = reader.readLine();
            Files.write(destPath, fileLine.getBytes(), StandardOpenOption.APPEND);

            fileLine = reader.readLine();
            do {
                Files.write(destPath, fileLine.getBytes(),  StandardOpenOption.APPEND);
                fileLine = parseLine(reader.readLine());
            } while (fileLine != null);
        }
     }

    public static String parseLine(String fileLine) {
        if (fileLine == null)
            return null;

        String[] values = fileLine.split(",");
        int runtime = Integer.parseInt(values[6]);

        if (runtime > 30000) {
            values[6] = "30000";

            StringBuilder stringBuilder = new StringBuilder();
            for (String s : values)
                stringBuilder.append(s).append(",");
            stringBuilder.append("\n");

            return stringBuilder.toString();
        }

        return fileLine + "\n";
    }
}
