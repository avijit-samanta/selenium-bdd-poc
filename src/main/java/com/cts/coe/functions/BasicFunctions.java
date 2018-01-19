package com.cts.coe.functions;

import java.util.concurrent.TimeUnit;

import org.junit.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;


public class BasicFunctions {
	public String baseUrl = "http://the-internet.herokuapp.com/login";
	String driverPath = "C:\\BrowserDriver\\chromedriver.exe";
	public WebDriver driver;

	public void launchApplication() {
		System.setProperty("webdriver.chrome.driver", driverPath);		
		driver = new ChromeDriver();
		driver.manage().timeouts().implicitlyWait(20, TimeUnit.SECONDS);		
		driver.get(baseUrl);
		String expectedTitle = "The Internet";
		String actualTitle = driver.getTitle();
		Assert.assertEquals(actualTitle, expectedTitle);
		
	}
	
	
	public void closeApplication() {
		driver.close();
	}

	public static void main(String[] args) {
		BasicFunctions function = new BasicFunctions();
		function.launchApplication();
		function.closeApplication();
	}
}
