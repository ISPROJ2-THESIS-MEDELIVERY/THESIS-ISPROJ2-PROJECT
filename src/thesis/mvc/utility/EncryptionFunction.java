package thesis.mvc.utility;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;

import java.security.Key;

public class EncryptionFunction {

	private String secretStr = "&F)J@NcRfUjWnZr4";
	
	/* In case I ever have a random string generator to make and give different keys to different entries.
	//public void setSecretStr(String secretStr) {
	//	this.secretStr = secretStr;
	//}
	*/
	
	public String encrypt(String str){

		try {
			
			Key aesKey = new SecretKeySpec(this.secretStr.getBytes(), "AES");
			Cipher ecipher = Cipher.getInstance("AES");

			ecipher.init(Cipher.ENCRYPT_MODE, aesKey);
			
			byte[] utf8 = str.getBytes("UTF8");

			// Encrypt
			byte[] enc = ecipher.doFinal(utf8);
			
			// Encode bytes to base64 to get a string
			return new Base64().encodeToString(enc);//new sun.misc.BASE64Encoder().encode(enc);
			
		} catch(Exception e) {
			
		}
		
		return null;
	}

	public String decrypt(String str){
		
		try {
			
			Key aesKey = new SecretKeySpec(this.secretStr.getBytes(), "AES");
			Cipher dcipher = Cipher.getInstance("AES");

			dcipher.init(Cipher.DECRYPT_MODE, aesKey);
			// Decode base64 to get bytes
			byte[] dec = new Base64().decode(str);//new sun.misc.BASE64Decoder().decodeBuffer(str);

			byte[] utf8 = dcipher.doFinal(dec);

			// Decode using utf-8
			return new String(utf8, "UTF8");

		} catch (Exception e ) {
			
		}
		
		return null;
	}

}
