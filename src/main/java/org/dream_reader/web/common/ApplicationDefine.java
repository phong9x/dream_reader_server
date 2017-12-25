/*
 * Created on 2 thg 10 2017 ( Time 17:19:13 )
 * Code by Kenny Phong
 */
package org.dream_reader.web.common;

public class ApplicationDefine {
	public enum UserRole {

		User((short)1), Admin((short)2);
		
		short code;

		UserRole(short code) {
			this.code = code;
		}

		public short getCode() {
			return code;
		}
	}
	
	public enum Payment_Status {

		Watting((short)0), Success((short)1), Cancel((short)2);
		
		short code;

		Payment_Status(short code) {
			this.code = code;
		}

		public short getCode() {
			return code;
		}
	}
}