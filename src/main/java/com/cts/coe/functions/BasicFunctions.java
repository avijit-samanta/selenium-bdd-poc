package com.cts.coe.functions;

import java.util.concurrent.TimeUnit;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.testng.Assert;

import io.github.bonigarcia.wdm.ChromeDriverManager;


public class BasicFunctions {
	public String baseUrl = "http://the-internet.herokuapp.com/login";
	String driverPath = "/usr/local/share/chromedriver"; 		// <- For Ubuntu 
	//String driverPath = "C:\\BrowserDriver\\chromedriver.exe";	// <- For Windows 
	public WebDriver driver;

	public void launchApplication() {
		System.setProperty("webdriver.chrome.driver", driverPath);
		
		ChromeDriverManager.getInstance().setup();
        ChromeOptions options = new ChromeOptions();
        
        options.addArguments("--headless", "--disable-gpu","window-size=1920,1080","--no-sandbox");
        driver =  new ChromeDriver(options);
        

		/*DesiredCapabilities capabilities = DesiredCapabilities.chrome();
		String[] options = new String[] { "--start-maximized", "--headless" };
		capabilities.setCapability("chrome.switches", options);
		driver = new RemoteWebDriver(service.getUrl(), capabilities);*/
		
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
