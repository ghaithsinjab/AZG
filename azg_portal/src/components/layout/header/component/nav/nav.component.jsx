import { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import {Link, useLocation} from 'react-router-dom';
import { selectNav } from "../../../../../store/nav/nav.selectors";

import {navIsCurrent} from '../../../../../utils/helper.utils';

import './nav.styles.scss';

const Nav = ({forMobile}) => {
    const nav = useSelector(selectNav);
    const location = useLocation();
    const [currentPath, setCurrentPath] = useState('');
    useEffect(() => {
        setCurrentPath(location.pathname);
    }, [location]);
    return (
        <ul className={forMobile?'small-menu-items':'menu-container'}>
            {
                nav?.map(item => (
                    <li key={item.id} className={forMobile?'':`menu-item${navIsCurrent(item, currentPath) ? ' current': ''}`}>
                        <Link to={item.path} className={forMobile?'':'menu-link'}>
                            {item.title}
                        </Link>
                    </li>
                ))
            }
        </ul>
    )
}

export default Nav;