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
        print("Loading email pane")
        page.evaluate(
            "document.getElementById('email_pane').setAttribute('style', 'height: 500%; width: 100%;');"
        )
        print("Enlarging email pane")
        file_name = f"{datetime.now().strftime('%Y-%m-%d_%H-%M-%S')}_email.png"
        page.locator("#email_pane").screenshot(path=file_name)
        print(f"Saved screenshot to {file_name}")
        browser.close()


if __name__ == "__main__":
    screenshot_mailinator_email()
