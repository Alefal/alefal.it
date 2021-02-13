import React, { PropTypes } from 'react';
import Button from 'react-bootstrap/lib/Button';
import Panel from 'react-bootstrap/lib/Panel';
import Pagination from 'react-bootstrap/lib/Pagination';
import PageHeader from 'react-bootstrap/lib/PageHeader';
import Well from 'react-bootstrap/lib/Well';


const title = 'ReduxExample';

function displayReduxExample(props, context) {
  context.setTitle(title);
  return (
    <div>
      <div className="col-lg-12">
        <PageHeader>Redux Example</PageHeader>
      </div>
    </div>

  );
}


displayReduxExample.contextTypes = { setTitle: PropTypes.func.isRequired };
export default displayReduxExample;
