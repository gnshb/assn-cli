const puppeteer = require('puppeteer');
const fs = require('fs');

function delay(time) {
   return new Promise(function(resolve) {
       setTimeout(resolve, time)
   });
}

(async () => {
  const browser = await puppeteer.launch({ headless: true });
  const page = await browser.newPage();
  const loginUrl = 'https://courses.iitm.ac.in/login/index.php';
  const username;
  const password;
  await page.goto(loginUrl, { waitUntil: 'networkidle2' });
  await page.type('input[name="username"]', username);
  await page.type('input[name="password"]', password); 
  await page.click('button[type="submit"]'); 
  const protectedUrl = 'https://courses.iitm.ac.in/my/';
  await page.goto(protectedUrl);
  await delay(2000);
  const htmlContent = await page.content(); 
  const mhtml = await page.content({ format: 'mhtml' });
  fs.writeFileSync('./temp.mhtml', mhtml);
  await browser.close();
})();

