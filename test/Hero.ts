import "@nomicfoundation/hardhat-ethers";
import { ethers } from "hardhat";
import { expect } from "chai";

describe("Hero", function () {
    async function createHero() {
        const Hero = await ethers.getContractFactory("Hero");
        const hero = await Hero.deploy();
        await hero.waitForDeployment();
        return hero;
    }
    let hero;
    before(async function () {
        hero = await createHero();
    });

    it("should get a zero hero array", async function () {
        expect(await hero.getHeroes()).to.deep.equal([]);
    })

    it("should fail at creating hero because of paymeny", async function () {
        let e;
        try {
            await hero.createHero(0, {
                value: ethers.parseEther("0.049999")
            })
        } catch (_e) {
            e = _e;
        }
        expect(e.message.includes("Please send more money, at least 0.05 ether")).to.equal(true);
    });
});