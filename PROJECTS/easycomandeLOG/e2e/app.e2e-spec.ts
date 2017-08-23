import { EasycomandeLOGPage } from './app.po';

describe('easycomande-log App', () => {
  let page: EasycomandeLOGPage;

  beforeEach(() => {
    page = new EasycomandeLOGPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
