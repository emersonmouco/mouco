from PySide6.QtCore import Qt #type: ignore
from PySide6.QtWidgets import QLabel, QWidget #type:ignore
from variables import SMALL_FONT_SIZE


class Info(QLabel):
    def __init__(self, text: str, parent: QWidget | None = None) -> None:
        super().__init__(text, parent)
        self.configStyle()

    def configStyle(self):
        self.setStyleSheet(f'font-size: {SMALL_FONT_SIZE}px;')
        self.setAlignment(Qt.AlignmentFlag.AlignRight)