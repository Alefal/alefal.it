import React from 'react';
import { Link } from 'react-router-dom';

const Sep = () => <span> | </span>;
export const NavBar = () => {
    return (
        <div>
            <nav>
                <Link to="/">Homee</Link>
                <Sep />
                <Link to="/about">Aboute</Link>
                <Sep />
                <Link to="/users">Userse</Link>
            </nav>
        </div>
    )
};