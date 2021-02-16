import { Given, When, Then, And } from 'cypress-cucumber-preprocessor/steps';
import LivelyPage from '../../pages/lively/lively-page';

Given(/^I'm at the Lively homepage$/, () => {
  LivelyPage.visit();
});

When(`I click the {string} element`, (element) => {
  LivelyPage.getByTestId(element).click();
});

When(`I select the {string} option from the {string} dropdown`, (option, element) => {
  LivelyPage.getByTestId(element).select(option);
});

When(`I click the {string} css element`, (element) => {
  LivelyPage.getByCss(element).click();
});

When(`I type {word} into the {string} element`, (string, element) => {
  LivelyPage.getByTestId(element).type(string);
});

When(`I type {word} into the {string} css element`, (string, element) => {
  LivelyPage.getByCss(element).type(string);
});

When(`I clear the {string} element`, (element) => {
  LivelyPage.getByTestId(element).focus().clear();
});

And(`I enter my username`, () => {
  LivelyPage.getByTestId("login:input:email").type(Cypress.env('username'));
});

And(`I enter my password`, () => {
  LivelyPage.getByTestId("login:input:password").type(Cypress.env('password'));
});

Then(`I see {string} in the title`, (title) => {
  cy.title().should('include', title)
});

Then(`The {string} css element should contain {string}`, (element, text) => {
  LivelyPage.getByCss(element).contains(text);
});

Then('It should match visual snapshot', () => {
  LivelyPage.matchSnapshot();
});
