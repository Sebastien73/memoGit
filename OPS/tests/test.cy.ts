import {ROUTES} from "./constant.ts";

describe('Register', () => {
  it('should call register API and jump to home page when submit a valid form', () => {
    cy.visit(ROUTES.REGISTER)
    cy.get('[placeholder="Your Name"]').type('seb1')
    cy.get('[placeholder="Email"]').type('sebastien.jacquelin@le-campus-numerique.fr')
    cy.get('[placeholder="Password"]').type('12345678')
    cy.get('[type="submit"]').click()

    cy.wait(1000)
    cy.get('nav a.nav-link').last().should('contain.text','seb1')
    cy.url().should('contain',ROUTES.HOME)
  })
})

describe('Profile', () => {
  it('Verify that user don\'t have articles.', () => {
    cy.loginSeb1()
    cy.get('nav a.nav-link').last().contains('seb1').click()
    cy.get('div .article-preview').should("contain.text",'No articles are here... yet.')
    cy.wait(1000)
    cy.get('a.nav-link').last().contains('Favorited Articles').click()
    cy.get('div .article-preview').should("contain.text",'No articles are here... yet.')
    cy.wait(1000)
    cy.url().should('match',/\/#\/profile\/seb1\/favorites$/)
  })
})

describe('Create article', () => {
  it('create', () => {
    cy.loginSeb1()
    cy.get('nav a.nav-link').contains('New Post').click()

    cy.get('[placeholder="Article Title"]').type('seb')
    cy.get('[placeholder="What\'s this article about?"]').type('Nouveau post')
    cy.get('[placeholder="Write your article (in markdown)"]').type('Ceci est un nouvel article de seb')
    cy.get('[placeholder="Enter tags"]').type('SEB')
    cy.get('[type="submit"]').contains('Publish Article').click()

    cy.wait(1000)
    cy.url().should('match',/\/#\/article\/seb$/)
  });
})

describe('register another user', () =>{
  it('Create second user', () => {
    cy.visit(ROUTES.REGISTER)
    cy.get('[placeholder="Your Name"]').type('seb2')
    cy.get('[placeholder="Email"]').type('sebj@le-campus-numerique.fr')
    cy.get('[placeholder="Password"]').type('12345678')
    cy.get('[type="submit"]').click()
    cy.wait(1000)
    cy.get('nav a.nav-link').last().should('contain.text','seb2')
    cy.url().should('contain',ROUTES.HOME)
  })
})

describe('Follow the article created previously with second user', () => {
  it('Follow the article', () => {
    cy.loginSeb2()
    cy.intercept('POST', /\/api\/articles\/seb\/favorite$/).as('addFav')
    cy.url().should('contain',ROUTES.HOME)

    cy.get('a[href="#/article/seb"] > h1').contains('seb').click()
    cy.wait(1000)
    cy.url().should('match', /\/#\/article\/seb$/)

    cy.get('div[class="article-meta"] > button').contains('Favorite Article').click()
    cy.wait('@addFav').should('have.deep.nested.property', 'response.statusCode', 200)
    cy.get('div[class="article-meta"] > button').should('contain.text', 'Unfavorite Article')
    cy.visit('/#/profile/seb2/favorites')
    cy.get('div[class="article-preview"]').within(()=>{
      cy.get('h1').should('contain.text', 'seb')
    })
  })
})

describe('Verify if the current user has an article in Favorited Articles', () => {
  it('Verify if the article created previously is in list of favorited Articles', () => {
    cy.loginSeb2()
    cy.get('nav a.nav-link').last().contains('seb2').click()
    cy.wait(1000)
    cy.get('a.nav-link').last().contains('Favorited Articles').click()
    cy.wait(1000)
    cy.get('a[href="#/article/seb"]').within(()=>{
      cy.get('h1').should('contain.text', 'seb')
    })
    cy.wait(1000)
  })
})

describe('Verify the first user has an article with follow', () => {
  it('Verify article\'s list of the first user has article with follow', () => {
    cy.loginSeb1()
    cy.intercept('POST', /\/api\/articles\/seb\/favorite$/).as('checkFav')
    cy.get('nav a.nav-link').last().contains('seb1').click()
    cy.get('button[aria-label="Favorite article"]').first().click()
    cy.wait('@checkFav').should('have.deep.nested.property', 'response.statusCode', 200)
    cy.get('button[aria-label="Favorite article"]').first().should('contain.text', '1')
  });
})

