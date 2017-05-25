var LandingPage = require('../pageobjects/landing.page');
var chai = require('chai');

describe('Landing page', function() {
    it('should have correct title', function() {
        LandingPage.open();
        chai.expect(browser.getTitle()).to.equal(LandingPage.title);
    });
    it('should allow user to login if the username is specified and the Join button is clicked', function() {
        LandingPage.open();
        LandingPage.username.waitForExist();
        LandingPage.username.setValue('Maxim');
        LandingPage.joinWithButtonClick();
        LandingPage.loadedHomePage.waitForExist(5000);
    });
    it('should allow user to login if the username is specified and then Enter key is pressed', function() {
        LandingPage.open();
        LandingPage.username.waitForExist();
        LandingPage.username.setValue('Maxim');
        LandingPage.joinWithEnterKey();
        LandingPage.loadedHomePage.waitForExist(5000);
    });
    it('should not allow user to login if the username is not specified (login attemp being made using a button)', function() {
        LandingPage.open();
        // we intentionally don't enter username here
        LandingPage.joinWithButtonClick();
        browser.pause(5000); // amount of time we usually wait for the home page to appear
        chai.expect(browser.getUrl()).to.equal(LandingPage.url); // verify that we are still on the landing page
    });
    it('should not allow user to login if the username is not specified (login attempt is being made using Enter key', function() {
        LandingPage.open();
        // we intentionally don't enter username here
        LandingPage.joinWithEnterKey();
        browser.pause(5000); // amount of time we usually wait for the gome page to appear
        chai.expect(browser.getUrl()).to.equal(LandingPage.url);
    });
});
