package pl.javastart.readstack.config;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import javax.naming.NamingException;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebListener
public class DbInitializer implements ServletContextListener {
    private static final Pattern SQL_PATTERN = Pattern.compile(
            "^((?:CREATE|UPDATE|INSERT|ALTER)[\\s\\S]+?;.*)$",
            Pattern.MULTILINE
    );
    private final Connection connection;
    private final Statement statement;

    public DbInitializer() throws NamingException, SQLException {
        this.connection = DataSourceProvider.getDataSource().getConnection();
        this.statement = this.connection.createStatement();
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            boolean initializeDatabase = System.getenv("DB_INIT") != null;
            boolean tablesExist = statement.executeQuery("show tables;").next();
            if (initializeDatabase && !tablesExist) {
                executeInitScript();
                executeTestDataScript();
            }
        } catch (URISyntaxException | IOException | SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
    }

    private void executeInitScript() throws IOException, SQLException, URISyntaxException {
        Path schemaPath = Path.of(DbInitializer.class.getResource("/schema.sql").toURI());
        String initScript = Files.readString(schemaPath);
        Matcher sqlMatcher = SQL_PATTERN.matcher(initScript);
        System.out.println("Executing schema.sql script");
        while (sqlMatcher.find()) {
            String nextSqlStatement = sqlMatcher.group();
            System.out.println(nextSqlStatement);
            statement.executeUpdate(nextSqlStatement);
        }
    }

    private void executeTestDataScript() throws IOException, SQLException, URISyntaxException {
        Path schemaPath = Path.of(DbInitializer.class.getResource("/testdata.sql").toURI());
        String testScript = Files.readString(schemaPath);
        Matcher sqlMatcher = SQL_PATTERN.matcher(testScript);
        System.out.println("Executing testdata.sql script");
        while (sqlMatcher.find()) {
            String nextSqlStatement = sqlMatcher.group();
            System.out.println(nextSqlStatement);
            statement.executeUpdate(nextSqlStatement);
        }
    }

    private void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
