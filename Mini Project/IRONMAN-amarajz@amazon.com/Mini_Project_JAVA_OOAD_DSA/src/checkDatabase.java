public class checkDatabase {
        public static void main(String[] args) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("Working");
        }
        catch(Exception e) {
            System.err.println("couldn't connect");
        }
    
        }
    }
