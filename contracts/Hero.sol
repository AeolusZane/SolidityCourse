pragma solidity ^0.8.24;

/**
- 生成随机的英雄属性
- 英雄属性：strength, health, intellect, magic, dexterity
- 属性随机生
    - 创建英雄规则，价格：0.05 ETH，支付到founder账号,founder可以更改收款地址. 属性生成，随机生成属性值，值在0 ~ 18，0 ~ 17...，0 ~ 13之间随机 例如，第一次生成Health，值会在0 ~ 18之间随机，第二次生成Intellect，值会在0 ~ 17之间随机...
- 可以想像这个是个NFT，或者一个Game
    - 我们用ERC721对合约方法进行补充
 */

contract Hero {
    enum Class {
        Mage,
        Healer,
        Barbarian
    }

    mapping(address => uint[]) addressToHeroes;

    function getHeroes() public view returns (uint[] memory) {
        return addressToHeroes[msg.sender];
    }

    function getStrength(uint hero) public pure returns (uint) {
        return (hero >> 2) & 0x1F;
    }

    function getHealth(uint hero) public pure returns (uint) {
        return (hero >> 7) & 0x1F;
    }

    function getIntellect(uint hero) public pure returns (uint) {
        return (hero >> 12) & 0x1F;
    }

    function getMagic(uint hero) public pure returns (uint) {
        return (hero >> 17) & 0x1F;
    }

    function getDex(uint hero) public pure returns (uint) {
        return (hero >> 22) & 0x1F;
    }

    function generateRandom() public view returns (uint) {
        return
            uint(
                keccak256(
                    abi.encodePacked(
                        block.prevrandao,
                        block.timestamp,
                        msg.sender
                    )
                )
            );
    }

    function createHero(Class _class) public payable {
        // assert
        require(
            msg.value >= 0.05 ether,
            "Please send more money, at least 0.05 ether"
        );
        // 英雄属性：strength, health, intellect, magic, dexterity
        uint[] memory stats = new uint[](5);

        stats[0] = 2;
        stats[1] = 7;
        stats[2] = 12;
        stats[3] = 17;
        stats[4] = 22;

        uint len = 5;
        uint hero = uint(_class);

        do {
            uint pos = generateRandom() % len;
            uint value = (generateRandom() % (13 + len)) + 1;

            hero |= value << stats[pos];

            len--;
            stats[pos] = stats[len];
        } while (len > 0);

        addressToHeroes[msg.sender].push(hero);
    }
}
