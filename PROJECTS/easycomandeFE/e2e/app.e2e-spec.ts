import { EasycomandeFEPage } from './app.po';

describe('easycomande-fe App', function() {
  let page: EasycomandeFEPage;

  beforeEach(() => {
    page = new EasycomandeFEPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
