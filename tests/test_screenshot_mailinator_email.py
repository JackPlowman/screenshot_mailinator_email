from unittest.mock import MagicMock, patch

from screenshot_mailinator_email.screenshot_mailinator_email import (
    screenshot_mailinator_email,
)


@patch("sys.argv", ["https://mailinator.com"])
@patch("screenshot_mailinator_email.screenshot_mailinator_email.sync_playwright")
def test_screenshot_mailinator_email(_sync_playwright: MagicMock) -> None:
    # Act
    screenshot_mailinator_email()
    # Assert
