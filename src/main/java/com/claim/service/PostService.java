package com.claim.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.claim.entity.Post;
import com.claim.repository.PostRepository;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;
	
	@Transactional
	public List<Post> findMyPost(String username){
		
			String[] usernames = {username};
			return postRepository.findPost(usernames);	
	}
	
	@Transactional
	public List<Post> savePost(Post post) {
		postRepository.save(post);
		return findMyPost(post.getUsername());
	}
	
	
}
