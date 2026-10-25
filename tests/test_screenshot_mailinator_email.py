# Copyright (c) 2026 Jack Plowman

from unittest.mock import MagicMock, patch

from screenshot_mailinator_email import screenshot_mailinator_email


@patch(
    "screenshot_mailinator_email.argv",
    ["screenshot_mailinator_email.py", "https://mailinator.com"],
)
@patch("screenshot_mailinator_email.sync_playwright")
def test_screenshot_mailinator_email(mock_sync_playwright: MagicMock) -> None:
    screenshot_mailinator_email()

    playwright = mock_sync_playwright.return_value.__enter__.return_value
    browser = playwright.chromium.launch.return_value
    page = browser.new_page.return_value
    page.goto.assert_called_once_with("https://mailinator.com", wait_until="load")
    page.locator.assert_called_once_with("#email_pane")
    page.locator.return_value.screenshot.assert_called_once()
    browser.close.assert_called_once()
