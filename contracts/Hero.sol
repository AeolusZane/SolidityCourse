pragma solidity ^0.8.24;

/**
- 生成随机的英雄属性
- 用户可以选择他们想要生成的英雄类型
    - classes：Mage, Healer, Barbarian
    - Class不影响属性的创建，生成一个稀有属性的【史诗级】英雄概率很小
- 生成一个英雄支付0.05个ETH
- 可以通过address访问生成的英雄
- 英雄存储在链上
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

    function getHeroes() public view returns (uint[] memory){
        return addressToHeroes[msg.sender];
    }

    function createHero(Class _class) public payable {
        // assert
        require(
            msg.value >= 0.05 ether,
            "Please send more money, at least 0.05 ether"
        );
    }
}
