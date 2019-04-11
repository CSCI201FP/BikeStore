package login_signup;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

public class PasswordHasher {
    public static final byte[] SALT = "DONALD!TRUMP!LOVES@XI?DA?DA".getBytes(StandardCharsets.UTF_8);
    public static final int KEY_LENGTH = 128;
    public static final int NUM_ITERATION = 10000;

    public static byte[] hash(final String password){
        return hash(password.toCharArray(), SALT, NUM_ITERATION, KEY_LENGTH);
    }

    private static byte[] hash(final char[] password, final byte[] salt, final int numIteration, final int keyLength) {
        try {
            SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA512");
            PBEKeySpec spec = new PBEKeySpec(password, salt, numIteration, keyLength);
            return skf.generateSecret(spec).getEncoded();
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            System.out.println("Hash Error: " + e.getMessage());
            e.printStackTrace();
            throw (new RuntimeException(e));
        }
    }

}
