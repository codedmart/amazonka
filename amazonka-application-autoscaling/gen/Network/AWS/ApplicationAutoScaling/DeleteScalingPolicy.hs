{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.ApplicationAutoScaling.DeleteScalingPolicy
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes an Application Auto Scaling scaling policy that was previously created. If you are no longer using a scaling policy, you can delete it with this operation.
--
-- Deleting a policy deletes the underlying alarm action, but does not delete the CloudWatch alarm associated with the scaling policy, even if it no longer has an associated action.
--
-- To create a new scaling policy or update an existing one, see < PutScalingPolicy>.
module Network.AWS.ApplicationAutoScaling.DeleteScalingPolicy
    (
    -- * Creating a Request
      deleteScalingPolicy
    , DeleteScalingPolicy
    -- * Request Lenses
    , dspPolicyName
    , dspServiceNamespace
    , dspResourceId
    , dspScalableDimension

    -- * Destructuring the Response
    , deleteScalingPolicyResponse
    , DeleteScalingPolicyResponse
    -- * Response Lenses
    , dsprsResponseStatus
    ) where

import           Network.AWS.ApplicationAutoScaling.Types
import           Network.AWS.ApplicationAutoScaling.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'deleteScalingPolicy' smart constructor.
data DeleteScalingPolicy = DeleteScalingPolicy'
    { _dspPolicyName        :: !Text
    , _dspServiceNamespace  :: !ServiceNamespace
    , _dspResourceId        :: !Text
    , _dspScalableDimension :: !ScalableDimension
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteScalingPolicy' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dspPolicyName'
--
-- * 'dspServiceNamespace'
--
-- * 'dspResourceId'
--
-- * 'dspScalableDimension'
deleteScalingPolicy
    :: Text -- ^ 'dspPolicyName'
    -> ServiceNamespace -- ^ 'dspServiceNamespace'
    -> Text -- ^ 'dspResourceId'
    -> ScalableDimension -- ^ 'dspScalableDimension'
    -> DeleteScalingPolicy
deleteScalingPolicy pPolicyName_ pServiceNamespace_ pResourceId_ pScalableDimension_ =
    DeleteScalingPolicy'
    { _dspPolicyName = pPolicyName_
    , _dspServiceNamespace = pServiceNamespace_
    , _dspResourceId = pResourceId_
    , _dspScalableDimension = pScalableDimension_
    }

-- | The name of the scaling policy to delete.
dspPolicyName :: Lens' DeleteScalingPolicy Text
dspPolicyName = lens _dspPolicyName (\ s a -> s{_dspPolicyName = a});

-- | The namespace for the AWS service that the scaling policy is associated with. For more information, see <http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces AWS Service Namespaces> in the Amazon Web Services General Reference.
dspServiceNamespace :: Lens' DeleteScalingPolicy ServiceNamespace
dspServiceNamespace = lens _dspServiceNamespace (\ s a -> s{_dspServiceNamespace = a});

-- | The resource type and unique identifier string for the resource associated with the scaling policy. For Amazon ECS services, the resource type is 'services', and the identifier is the cluster name and service name; for example, 'service\/default\/sample-webapp'. For Amazon EC2 Spot fleet requests, the resource type is 'spot-fleet-request', and the identifier is the Spot fleet request ID; for example, 'spot-fleet-request\/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE'.
dspResourceId :: Lens' DeleteScalingPolicy Text
dspResourceId = lens _dspResourceId (\ s a -> s{_dspResourceId = a});

-- | The scalable dimension associated with the scaling policy. The scalable dimension contains the service namespace, resource type, and scaling property, such as 'ecs:service:DesiredCount' for the desired task count of an Amazon ECS service, or 'ec2:spot-fleet-request:TargetCapacity' for the target capacity of an Amazon EC2 Spot fleet request.
dspScalableDimension :: Lens' DeleteScalingPolicy ScalableDimension
dspScalableDimension = lens _dspScalableDimension (\ s a -> s{_dspScalableDimension = a});

instance AWSRequest DeleteScalingPolicy where
        type Rs DeleteScalingPolicy =
             DeleteScalingPolicyResponse
        request = postJSON applicationAutoScaling
        response
          = receiveEmpty
              (\ s h x ->
                 DeleteScalingPolicyResponse' <$> (pure (fromEnum s)))

instance Hashable DeleteScalingPolicy

instance NFData DeleteScalingPolicy

instance ToHeaders DeleteScalingPolicy where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AnyScaleFrontendService.DeleteScalingPolicy" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteScalingPolicy where
        toJSON DeleteScalingPolicy'{..}
          = object
              (catMaybes
                 [Just ("PolicyName" .= _dspPolicyName),
                  Just ("ServiceNamespace" .= _dspServiceNamespace),
                  Just ("ResourceId" .= _dspResourceId),
                  Just ("ScalableDimension" .= _dspScalableDimension)])

instance ToPath DeleteScalingPolicy where
        toPath = const "/"

instance ToQuery DeleteScalingPolicy where
        toQuery = const mempty

-- | /See:/ 'deleteScalingPolicyResponse' smart constructor.
newtype DeleteScalingPolicyResponse = DeleteScalingPolicyResponse'
    { _dsprsResponseStatus :: Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteScalingPolicyResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dsprsResponseStatus'
deleteScalingPolicyResponse
    :: Int -- ^ 'dsprsResponseStatus'
    -> DeleteScalingPolicyResponse
deleteScalingPolicyResponse pResponseStatus_ =
    DeleteScalingPolicyResponse'
    { _dsprsResponseStatus = pResponseStatus_
    }

-- | The response status code.
dsprsResponseStatus :: Lens' DeleteScalingPolicyResponse Int
dsprsResponseStatus = lens _dsprsResponseStatus (\ s a -> s{_dsprsResponseStatus = a});

instance NFData DeleteScalingPolicyResponse
