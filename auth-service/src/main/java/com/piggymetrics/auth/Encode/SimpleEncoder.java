package com.piggymetrics.auth.Encode;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.security.SecureRandom;
import java.util.regex.Pattern;


public class SimpleEncoder implements PasswordEncoder {
    private Pattern BCRYPT_PATTERN;

    public SimpleEncoder() {
        this(-1);
    }

    public SimpleEncoder(int strength) {

    }


    public String encode(CharSequence rawPassword) {
        return rawPassword.toString();
    }

    //JUST FOR TEST - Always AUTH!
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        if (rawPassword.equals(encodedPassword )) {
            return true;
        }

        return true;
    }
}
