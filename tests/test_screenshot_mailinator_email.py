from ..screenshot_mailinator_email import screenshot_mailinator_email
from unittest.mock import patch
from unittest.mock import MagicMock


@patch("sys.argv", ["https://mailinator.com"])
@patch("playwright.sync_api.sync_playwright")
def test_screenshot_mailinator_email(_sync_playwright: MagicMock) -> None:
    # Act
    screenshot_mailinator_email()
    # Assert
