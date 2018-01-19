package com.cts.step.definitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import cucumber.api.java.en.Then;

import com.cts.coe.pages.ApplicationLoginPage;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.But;

public class GlobalStepDefinitions extends ApplicationLoginPage{
	@Given("^I am on the \"([^\"]*)\" page on URL \"([^\"]*)\"$")
	public void loginApplication(String company, String site) throws Throwable {
		System.out.println(company + " : " + site);
		launchApplication();
		loginApplication();
		closeApplication(); 
	}

	@When("^I fill in \"([^\"]*)\" with \"([^\"]*)\"$")
	public void i_fill_in_with(String arg1, String arg2) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		throw new PendingException();
	}

	@When("^I click on the \"([^\"]*)\" button$")
	public void i_click_on_the_button(String arg1) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		throw new PendingException();
	}

	@Then("^I should see \"([^\"]*)\" message$")
	public void i_should_see_message(String arg1) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		throw new PendingException();
	}

	@Then("^I should see the \"([^\"]*)\" button$")
	public void i_should_see_the_button(String arg1) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		throw new PendingException();
	}

	@Given("^you are in Given annotation$")
	public void given() throws Throwable {
	}

	@When("^you are in When annotation$")
	public void when() throws Throwable {
	}

	@Then("^you are in Then annotation$")
	public void then() throws Throwable {
	}

	@And("^you are in And annotation$")
	public void and() throws Throwable {
	}

	@But("^you are in But annotation$")
	public void but() throws Throwable {
	}

}
