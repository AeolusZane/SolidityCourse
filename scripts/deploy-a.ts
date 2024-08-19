import "@nomicfoundation/hardhat-ethers";
import { ethers } from "hardhat";

async function deploy(name, ...args) { // 解构
    const Fallback = await ethers.getContractFactory(name);
    const fallback = await Fallback.deploy(...args);
    await fallback.waitForDeployment();
    console.log('fallback address is', await fallback.getAddress());
    return fallback;
}

async function fallback() {
    const a = await deploy("A");
    const b = await deploy("B", await a.getAddress());

    console.log("A", await a.getA());
    console.log("B", await b.getB());
    console.log("-----------------");

    await a.setA(42);
    console.log("A", await a.getA());
    console.log("B", await b.getB());
    console.log("-----------------");

    await b.setB(60);
    console.log("A", await a.getA());
    console.log("B", await b.getB());
    console.log("-----------------");


}

fallback();