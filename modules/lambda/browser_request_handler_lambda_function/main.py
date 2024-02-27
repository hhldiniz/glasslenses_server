from typing import Optional, Dict


def main(event: dict, context: Optional[Dict]):
    print(f"Received event: {event}")
    print(f"Received context: {context}")
