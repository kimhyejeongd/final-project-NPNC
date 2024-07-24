package com.project.npnc.admin.document.model.dto;


import com.project.npnc.admin.department.model.dto.Department;
import com.project.npnc.admin.job.model.dto.Job;
import com.project.npnc.security.dto.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminDocument {
    private int erStorageKey;
    private int erStorageFolderKey;
    private String erStorageName;
    private int erStorageTerm;
    private int erStorageManager;
    private int erStorageOrderby;
    private Member member;
    private StorageFolder storageFolder;
    private Job job;
    private Department department;
}
