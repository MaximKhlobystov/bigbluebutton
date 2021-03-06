import React from 'react';
import { defineMessages, injectIntl } from 'react-intl';
import { withTracker } from 'meteor/react-meteor-data';
import { Session } from 'meteor/session';
import { getVideoUrl } from './service';
import ExternalVideo from './component';

const intlMessages = defineMessages({
  title: {
    id: 'app.externalVideo.title',
    description: '',
  },
});

const ExternalVideoContainer = props => (
  <ExternalVideo {...{ ...props }} />
);

export default injectIntl(withTracker(({ intl, isPresenter }) => {
  const title = intl.formatMessage(intlMessages.title);
  const inEchoTest = Session.get('inEchoTest');
  return {
    inEchoTest,
    title,
    isPresenter,
    videoUrl: getVideoUrl(),
  };
})(ExternalVideoContainer));
