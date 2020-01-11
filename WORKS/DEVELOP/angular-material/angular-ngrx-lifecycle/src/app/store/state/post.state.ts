import { Post } from 'src/app/models/post.interface';

export default class PostState {
    Posts: Array<Post>;
    PostError: Error;
    PostSelected: Post;
}

export const initializeState = (): PostState => {
    return { 
        Posts: Array<Post>(), 
        PostError: null,
        PostSelected: null
    };
};
