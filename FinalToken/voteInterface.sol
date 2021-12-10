pragma solidity >=0.5.12;

interface SetterLike {
    function file(bytes32, address) external;
    function file(bytes32, uint) external;
    function file(bytes32, bytes32, uint) external;
    function file(bytes32, bytes32, address) external;
    function rely(address) external;
    function deny(address) external;
    function init(bytes32) external;
    function drip() external;
    function drip(bytes32) external;
}

interface EndLike {
    function cage() external;
    function cage(bytes32) external;
}

interface PauseLike {
    function setAuthority(address) external;
    function setDelay(uint) external;
}

contract GovActions {
    function file(address who, bytes32 what, address data) public {
        SetterLike(who).file(what, data);
    }

    function file(address who, bytes32 what, uint data) public {
        SetterLike(who).file(what, data);
    }

    function file(address who, bytes32 ilk, bytes32 what, uint data) public {
        SetterLike(who).file(ilk, what, data);
    }

    function file(address who, bytes32 ilk, bytes32 what, address data) public {
        SetterLike(who).file(ilk, what, data);
    }

    function dripAndFile(address who, bytes32 what, uint data) public {
        SetterLike(who).drip();
        SetterLike(who).file(what, data);
    }

    function dripAndFile(address who, bytes32 ilk, bytes32 what, uint data) public {
        SetterLike(who).drip(ilk);
        SetterLike(who).file(ilk, what, data);
    }

    function rely(address who, address to) public {
        SetterLike(who).rely(to);
    }

    function deny(address who, address to) public {
        SetterLike(who).deny(to);
    }

    function init(address who, bytes32 ilk) public {
        SetterLike(who).init(ilk);
    }

    function cage(address end) public {
        EndLike(end).cage();
    }

    function setAuthority(address pause, address newAuthority) public {
        PauseLike(pause).setAuthority(newAuthority);
    }

    function setDelay(address pause, uint newDelay) public {
        PauseLike(pause).setDelay(newDelay);
    }

    function setAuthorityAndDelay(address pause, address newAuthority, uint newDelay) public {
        PauseLike(pause).setAuthority(newAuthority);
        PauseLike(pause).setDelay(newDelay);
    }
}
