import { useEffect, useState, useCallback } from 'react';
import { useContract, useProvider, useAccount } from 'wagmi';

import contracts from '@/contracts/hardhat_contracts.json';
import { NETWORK_ID } from '@/config';
import {ethers} from 'ethers'

function Split() {
    const chainId = Number(NETWORK_ID);
    const [currentGreeter, setCurrentGreeter] = useState('');
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');
    const { address, isConnecting, isDisconnected } = useAccount()



  return (
    <div>
         
    </div>
  )
}

export default Split