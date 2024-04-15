package com.kh.spring.webrtc.model;

public class EncodeUtil {
	// Method to encode a string using Base64
    public static String encode(String input) {
        return java.util.Base64.getEncoder().encodeToString(input.getBytes());
    }

    // Method to decode a Base64 encoded string
    public static String decode(String encodedString) {
        byte[] decodedBytes = java.util.Base64.getDecoder().decode(encodedString);
        return new String(decodedBytes);
    }

    // You can add more encoding/decoding methods as needed
}
