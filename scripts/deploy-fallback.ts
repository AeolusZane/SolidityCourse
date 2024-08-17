import "@nomicfoundation/hardhat-ethers";
import { ethers } from "hardhat";

async function deploy() {
    const Fallback = await ethers.getContractFactory("Fallback");
    const fallback = await Fallback.deploy();
    await fallback.waitForDeployment();
    console.log('fallback address is', await fallback.getAddress());
    return fallback;
}

async function count(fallback: any) {
    const interfaceFallback = await ethers.getContractAt("IFallback",await fallback.getAddress());
    await interfaceFallback.count();
}

deploy().then(count);