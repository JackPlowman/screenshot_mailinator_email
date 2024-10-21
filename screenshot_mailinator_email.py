from playwright.sync_api import sync_playwright
from datetime import datetime
from sys import argv


def screenshot_mailinator_email() -> None:
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()
        page.goto(
            argv[1],
            wait_until="load",
        )
        page.wait_for_timeout(2000)
        page.evaluate(
            "document.getElementById('email_pane').setAttribute('style', 'height: 500%; width: 100%;');"
        )
        page.locator("#email_pane").screenshot(
            path=f"{datetime.now().strftime('%Y-%m-%d_%H-%M-%S')}_email.png"
        )
        browser.close()


if __name__ == "__main__":
    screenshot_mailinator_email()
