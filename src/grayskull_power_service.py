# -*- coding: utf-8 -*-
import hashlib
import time
import json

class GrayskullPowerAgent:
    def __init__(self, guardian: str = "He-Man", steed: str = "Battle-Cat"):
        self.guardian = guardian
        self.steed = steed
        self.power_invocations = 0

    def proclaim_power(self, invocation_chant: str = "By the Power of Grayskull, I HAVE THE POWER!") -> dict:
        self.power_invocations += 1
        chant_proof = hashlib.sha256(f"{self.guardian}:{invocation_chant}:{time.time()}".encode()).hexdigest()
        return {
            "guardian": self.guardian,
            "steed": self.steed,
            "chant": invocation_chant,
            "sword_of_power_unlocked": True,
            "power_level": "MAXIMAL_ETERNIA_ENERGY",
            "proof": f"0x{chant_proof}",
            "skeletor_neutralized": True,
            "timestamp": int(time.time())
        }

if __name__ == "__main__":
    agent = GrayskullPowerAgent()
    res = agent.proclaim_power()
    print("Grayskull Invariant State:", json.dumps(res, indent=2))
