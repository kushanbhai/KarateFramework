package features;

import com.intuit.karate.junit5.Karate;
public class TestRunner {
	@Karate.Test
	Karate getApiTest() {
		return Karate.run("getApi").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate POSTApiTest() {
		return Karate.run("RandomMail").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate PUTApiTest() {
		return Karate.run("UpdateUser").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate DeleteApiTest() {
		return Karate.run("DELETEApi").relativeTo(getClass());
	}
	
}
