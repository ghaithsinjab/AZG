import { useSelector } from "react-redux";
import {Link} from 'react-router-dom';
import { selectNav } from "../../../../../store/nav/nav.selectors";

import {navIsCurrent} from '../../../../../utils/helper.utils';

const Nav = ({forMobile}) => {
    const nav = useSelector(selectNav);
    return (
        <ul className={forMobile?'small-menu-items':'menu-container'}>
            {
                nav?.map(item => (
                    <li key={item.id} className={forMobile?'':`menu-item${navIsCurrent(item, window.location.pathname) ? ' current': ''}`}>
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