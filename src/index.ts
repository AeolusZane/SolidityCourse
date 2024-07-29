import { ethers } from "ethers";
import { abi } from '../artifacts/contracts/Counter.sol/Counter.json';

function getEth() {
    // @ts-ignore
    const eth = window.ethereum;
    if (!eth) {
        throw new Error("No ethereum provider found");
    }
    return eth;
}

async function requestAccess() {
    const eth = getEth();
    const result = await eth.request({ method: "eth_requestAccounts" }) as string[];
    return result && result.length > 0;
}

async function hasSigners() {
    const metamask = getEth();
    const signers = await metamask.request({ method: "eth_accounts" }) as string[];
    return signers.length > 0;
}

async function getContract() {
    // 1. 地址
    // 2. 方法名
    // 3. provider
    // 4. signer

    if (!await hasSigners() && !await requestAccess()) {
        throw new Error("No ethereum provider found");
    }
    const provider = new ethers.BrowserProvider(getEth());
    const address = "0x1eA11d3eEc51ed07c319046c04FAFdEc478Bc915";
    const contract = new ethers.Contract(
        address,
        abi,
        await provider.getSigner(),
    )
    const counter = document.createElement("div");
    async function getCount() {
        counter.innerHTML = await contract.getCount();
    }
    getCount();
    const btn = document.createElement("button");
    btn.innerHTML = "increment";
    btn.onclick = async function () {
        await contract.count();
    }

    contract.on(contract.filters.CounterInc(), async function ({ args }) {
        counter.innerHTML = args[0].toString() || await contract.getCount();
    })

    document.body.appendChild(counter);
    document.body.appendChild(btn);
}

async function main() {
    await getContract();
}

main();